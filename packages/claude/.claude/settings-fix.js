const fs = require('fs');
const path = require('path');

function sortKeys(obj) {
  if (Array.isArray(obj)) {
    return obj
      .map(item => sortKeys(item))
      .sort();
  }

  if (obj !== null && typeof obj === 'object') {
    const sorted = {};
    Object.keys(obj)
      .sort()
      .forEach(key => {
        sorted[key] = sortKeys(obj[key]);
      });
    return sorted;
  }

  return obj;
}

const filePath = path.join(__dirname, 'settings.json');
const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));

delete data.model;
const sorted = sortKeys(data);

fs.writeFileSync(filePath, JSON.stringify(sorted, null, 2) + '\n');
console.log('Settings fixed and written back to settings.json');
