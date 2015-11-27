package br.com.ecclesia.relatorios;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.ecclesia.model.relatorios.CadMembros;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;

@Controller
public class ContatoMembros {


	@RequestMapping(value = "/secretaria/relatorios/membrosContatos/", method = RequestMethod.GET)
	public String loadSurveyPg(@ModelAttribute("jasperInputForm") CadMembros jasperInputForm, Model model) {
		model.addAttribute("JasperInputForm", jasperInputForm);
		return "pages/secretaria/relatorios/membrosContatos";
	}
	                         
	@RequestMapping(value = "/secretaria/relatorios/membrosContatos/membrosContatos", method = RequestMethod.POST)
	public String generateReport(@Valid @ModelAttribute("jasperInputForm") CadMembros jasperInputForm,
			BindingResult result, Model model, HttpServletRequest request, HttpServletResponse response)
					throws ParseException {

		if (result.hasErrors()) {
			System.out.println("validation error occured in jasper input form");
			return "pages/secretaria/relatorios/membrosContatos";

		}

		String reportFileName = "Membros";

		Connection conn = null;
		try {
			
			try {

				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				System.out.println("Please include Classpath Where your MySQL Driver is located");
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecclesia", "root", "Fa1808");

			if (conn != null) {
				System.out.println("Database Connected");
			} else {
				System.out.println(" connection Failed ");
			}



			JasperReport jasperReport = getCompiledFile(reportFileName, request);

			
			generateReportPDF(response, null, jasperReport, conn);

		} catch (Exception sqlExp) {
			sqlExp.printStackTrace();
			System.out.println("Exception::" + sqlExp.toString());

		} finally {

			try {

				if (conn != null) {
					conn.close();
					conn = null;
				}

			} catch (SQLException expSQL) {

				System.out.println("SQLExp::CLOSING::" + expSQL.toString());

			}

		}

		return null;

	}

	private JasperReport getCompiledFile(String fileName, HttpServletRequest request) throws JRException {
		System.out.println(
				"path " + request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));
		File reportFile = new File(
				request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));
		// If compiled file is not found, then compile XML template
		if (!reportFile.exists()) {
			JasperCompileManager.compileReportToFile(
					request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jrxml"),
					request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));
		}
		JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(reportFile.getPath());
		return jasperReport;
	}

	private void generateReportHtml(JasperPrint jasperPrint, HttpServletRequest req, HttpServletResponse resp)
			throws IOException, JRException {
		HtmlExporter exporter = new HtmlExporter();
		List<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		jasperPrintList.add(jasperPrint);
		exporter.setExporterInput(SimpleExporterInput.getInstance(jasperPrintList));
		exporter.setExporterOutput(new SimpleHtmlExporterOutput(resp.getWriter()));
		SimpleHtmlReportConfiguration configuration = new SimpleHtmlReportConfiguration();
		exporter.setConfiguration(configuration);
		exporter.exportReport();

	}

	private void generateReportPDF(HttpServletResponse resp, Map parameters, JasperReport jasperReport, Connection conn)
			throws JRException, NamingException, SQLException, IOException {
		byte[] bytes = null;
		bytes = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
		resp.reset();
		resp.resetBuffer();
		resp.setContentType("application/pdf");
		resp.setContentLength(bytes.length);
		ServletOutputStream ouputStream = resp.getOutputStream();
		ouputStream.write(bytes, 0, bytes.length);
		ouputStream.flush();
		ouputStream.close();
	}

}
