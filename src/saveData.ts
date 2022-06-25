import pg from 'pg';

export async function saveData(dataset: string, data: any[]): Promise<number | null> {
  const { Client } = pg;
  const client = new Client();
  await client.connect();

  const cols = Object.keys(data[0]);

  const params = data.map((item: any) => (
    `(${cols.map((col: string) => escapeStr(item[col]) ?? 'NULL').join(",")})`
  )).join(',');

  const query = /*sql*/`INSERT INTO ${dataset}
    (${cols.map((c) => escapeStr(c, '"')).join(',')})
    VALUES ${params};
  `;

  const res = await client.query(query).catch((err) => {
    console.error(query, err);
  });

  await client.end();
  return (res && res.rowCount) || null;
}

const escapeStr = (val: string | number, delimiter = `'`) => {
  if (val === 'suppressed' || val === null || val === '') {
    return null;
  }

  return isNaN(Number(val))
    ? `${delimiter}${String(val).replace("'", "''")}${delimiter}`
    : val;
};
