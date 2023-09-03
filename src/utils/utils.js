export function num(value) {
    if (!value) return '';
    return value.toLocaleString();
}

export function removeHTMLTag(value) {
    return value.replace(/<img.*?>/g, "[图片]")
        .replaceAll(/<[^>]+>/g, "")
        .replace(/&nbsp;/gi, "")
}