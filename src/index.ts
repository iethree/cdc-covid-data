import 'dotenv/config';
import { datasets, getApiData } from './fetchData';
import { saveData } from './saveData';
import _ from 'lodash';

for (const dataset of datasets) {
  console.log('Fetching data for', dataset);
  console.time(dataset);

  const queryData = await getApiData(dataset);

  console.log(`✅ ${queryData[dataset].length} rows fetched`);
  console.log('Saving data for', dataset);

  const dataChunks = _.chunk(queryData[dataset], 100);

  let savedRows = 0;
  for (const chunk of dataChunks) {
    const insertedRows = await saveData(dataset, chunk);
    if (insertedRows) {
      savedRows += insertedRows;
    }
  }

  console.timeEnd(dataset);
  console.log('✅', savedRows, 'rows saved\n');
}

console.log(`✅ done`, new Date());
process.exit(0);
