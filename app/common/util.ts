import path from "path";
import fs from "fs";

declare const __static: string;

// get application version from `static/version.txt`
export const getVersion = () => {
  const versionFilePath: string = path.resolve(__static, "version.txt");
  return fs.readFileSync(versionFilePath, {
    encoding: "utf-8",
  });
};
