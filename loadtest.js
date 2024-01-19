import http from 'k6/http';
import { sleep } from 'k6';
export const options = {
  discardResponseBodies: true,
  scenarios: {
    contacts: {
      executor: 'constant-vus',
      vus: 100,
      duration: '60s',
    }
  },
};
export default function () {
    let response = http.get(`http://${__ENV.URL}/`);
//    console.log(`Response status code: ${response.status}`);
}

