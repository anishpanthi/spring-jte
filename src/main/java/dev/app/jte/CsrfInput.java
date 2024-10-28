package dev.app.jte;

import gg.jte.Content;
import gg.jte.TemplateOutput;
import org.springframework.security.web.csrf.CsrfToken;

/**
 * @author Anish Panthi
 */
public class CsrfInput implements Content {

  private final CsrfToken csrfToken;

  public CsrfInput(CsrfToken csrfToken) {
    this.csrfToken = csrfToken;
  }

  @Override
  public void writeTo(TemplateOutput templateOutput) {
    if (this.csrfToken != null) {
      templateOutput.writeContent(
          "<input type=\"hidden\" name=\"%s\" value=\"%s\">"
              .formatted(csrfToken.getParameterName(), csrfToken.getToken()));
    }
  }
}
