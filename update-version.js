import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const packageJson = JSON.parse(fs.readFileSync('./package.json', 'utf8'));

const versionData = {
  version: packageJson.version,
  buildDate: new Date().toISOString(),
  gitCommit: process.env.GITHUB_SHA || 'unknown'
};

const versionFilePath = path.join(__dirname, 'version.json');
fs.writeFileSync(versionFilePath, JSON.stringify(versionData, null, 2));

console.log(`Version file updated: ${versionData.version}`);
