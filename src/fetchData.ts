import fetch from './fetchWithTimeout';

const BASE_URL = "https://covid.cdc.gov/covid-data-tracker/COVIDData/getAjaxData?id="

export const datasets = [
  'integrated_county_latest_external_data',
  'vaccination_county_condensed_data',
  'US_MAP_DATA',
  'county_view_state_data',
  // 'statusBar_v2_external_data'
];

export async function getApiData(dataset: string): Promise<any> {
  const endpoint = `${BASE_URL}${dataset}`;

  return fetch(endpoint)
    .then(async (response: any) => {
      if (response && response.ok){
        const apiResponse = await response.json() as any;
        return apiResponse;
      } else {
        console.error(response.statusText, dataset);
        return Promise.reject(response);
      }
    })
    .catch((err: any) => {
      return Promise.reject(err);
    });
}

