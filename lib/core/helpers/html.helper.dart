class HtmlHelper {
  HtmlHelper._();

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
