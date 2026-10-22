import { readFile } from "node:fs/promises";
import type { IncomingMessage, ServerResponse } from "node:http";
import { basename, dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import browserSync from "browser-sync";

const appDirectory = fileURLToPath(new URL("../app/", import.meta.url));

const markdownArguments = process.argv.slice(2);

if (markdownArguments.length !== 1) {
  console.error("Usage: node serve.ts <file.md>");
  process.exit(1);
}

const markdownPath = resolve(markdownArguments[0]);

async function serveIndex(
  request: IncomingMessage,
  response: ServerResponse,
  next: () => void,
): Promise<void> {
  if (request.url?.split("?")[0] === "/") {
    response.writeHead(200, { "content-type": "text/html; charset=utf-8" });
    response.end(await readFile(join(appDirectory, "index.html")));
    return;
  }
  next();
}

browserSync.create().init(
  {
    server: {
      baseDir: dirname(markdownPath),
      middleware: [serveIndex],
      routes: { "/app": appDirectory },
      serveStaticOptions: { dotfiles: "ignore" },
    },
    files: markdownPath,
    port: 4321,
    listen: "127.0.0.1",
    open: false,
    notify: false,
    ui: false,
    logLevel: "silent",
  },
  (error, browserSyncInstance) => {
    if (error) {
      console.error(error.message);
      process.exit(1);
    }
    const port = browserSyncInstance.getOption("port");
    const markdownName = encodeURIComponent(basename(markdownPath));
    console.log(`http://localhost:${port}/?file=${markdownName}`);
  },
);
