package com.web.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.web.entity.EmployeeBean;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * 
 * @author www.codejava.net
 *
 */
public class EmpPdf extends AbstractITextPdfView {
	
	final String fontPath = "c:\\windows\\fonts\\kaiu.ttf";
	BaseFont bfChinese;
	Font titleFont;
	
	Font normalFont;
	Font italicFont;
	Font underlineFont;

	// 設定字型物件
	private void init() throws Exception {
		bfChinese = BaseFont.createFont(fontPath, "Identity-H", BaseFont.NOT_EMBEDDED);
		titleFont = new Font(bfChinese, 18, Font.BOLD);
		normalFont = new Font(bfChinese, 14, Font.NORMAL);
		italicFont = new Font(bfChinese, 12, Font.ITALIC);
		underlineFont = new Font(bfChinese, 40, Font.UNDERLINE);
	}

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		init();
		// get data model which is passed by the Spring container
		System.out.println("running buildPdfDocument()");
		
		@SuppressWarnings("unchecked")
		List<EmployeeBean> list = (List<EmployeeBean>) model.get("allEmp");
        doc.add(new Paragraph("員工資料", titleFont));

		PdfPTable table = new PdfPTable(7);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 2.0f, 3.0f, 5.0f, 4.0f, 2.0f, 4.0f,  4.0f });
		table.setSpacingBefore(10);

		// define font for table header row
//		Font font = FontFactory.getFont(FontFactory.HELVETICA);

		// define table header cell
		PdfPCell cell = new PdfPCell();
//		cell.setBackgroundColor(BaseColor.BLUE);
		cell.setPadding(5);

		// write table header
		cell.setPhrase(new Phrase("No", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Name", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Email", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Password", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Gender", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Phone", normalFont));
		table.addCell(cell);

	//	cell.setPhrase(new Phrase("Logins", normalFont));
	//	table.addCell(cell);

		cell.setPhrase(new Phrase("Sign Up", normalFont));
		table.addCell(cell);

	//	cell.setPhrase(new Phrase("Status", normalFont));
	//	table.addCell(cell);

		// write table row data
		for (EmployeeBean mmb : list) {
			table.addCell(String.valueOf(mmb.getNo()));
			cell.setPhrase(new Phrase(String.valueOf(mmb.getName()), normalFont));
			table.addCell(cell);
//			table.addCell(String.valueOf(mmb.getMemberName()));
			table.addCell(String.valueOf(mmb.getEmail()));
			table.addCell(String.valueOf(mmb.getPassword()));
			table.addCell(String.valueOf(mmb.getGender()));
			table.addCell(String.valueOf(mmb.getPhoneNum()));
			//table.addCell(String.valueOf(mmb.getLogins()));
			table.addCell(String.valueOf(mmb.getRegisterTime()));
			//table.addCell(String.valueOf(mmb.getCertificationStatus()));
		}

		doc.add(table);

	}

}