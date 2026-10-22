import { transformerColorizedBrackets } from "https://esm.sh/@shikijs/colorized-brackets@4.5.0";
import { marked } from "https://esm.sh/marked@18.1.1";
import { bundledLanguages, codeToHtml } from "https://esm.sh/shiki@4.5.0";

const article = document.querySelector(".typeset");
const response = await fetch("/markdown");
const markdown = await response.text();
article.innerHTML = marked.parse(markdown);

for (const checkbox of article.querySelectorAll("li input[type=checkbox]")) {
  checkbox.closest("li").classList.add("task-list-item");
  checkbox.closest("ul").classList.add("contains-task-list");
}

for (const codeBlock of article.querySelectorAll("pre code")) {
  const language = codeBlock.className.replace("language-", "");
  codeBlock.parentElement.outerHTML = await codeToHtml(codeBlock.textContent, {
    lang: language in bundledLanguages ? language : "text",
    themes: { light: "light-plus", dark: "dark-plus" },
    defaultColor: "light-dark()",
    transformers: [transformerColorizedBrackets()],
  });
}
