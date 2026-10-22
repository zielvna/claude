import { transformerColorizedBrackets } from "https://esm.sh/@shikijs/colorized-brackets@4.5.0";
import { marked } from "https://esm.sh/marked@18.1.1";
import { bundledLanguages, codeToHtml } from "https://esm.sh/shiki@4.5.0";

const article = document.querySelector(".markdown");
const markdownName = new URLSearchParams(location.search).get("file");
const response = await fetch(`/${encodeURIComponent(markdownName)}`);
const markdown = await response.text();
article.innerHTML = marked.parse(markdown);

for (const codeBlock of article.querySelectorAll("pre code")) {
  const language = codeBlock.className.replace("language-", "");
  codeBlock.parentElement.outerHTML = await codeToHtml(codeBlock.textContent, {
    lang: language in bundledLanguages ? language : "text",
    themes: { light: "light-plus", dark: "dark-plus" },
    defaultColor: "light-dark()",
    transformers: [transformerColorizedBrackets()],
  });
}
