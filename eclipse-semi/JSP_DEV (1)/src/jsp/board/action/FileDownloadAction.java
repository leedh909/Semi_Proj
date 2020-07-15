package jsp.board.action;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class FileDownloadAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// �ٿ�ε��� ���ϸ��� �����´�.
		String fileName = request.getParameter("file_name");

		// ������ �ִ� �����θ� �����´�.
		// ���� ���ε�� ������ UploadFolder ������ �ִ�.
		String folder = request.getServletContext().getRealPath("UploadFolder");
		// ������ �����θ� �����.
		String filePath = folder + "/" + fileName;

		try {
			File file = new File(filePath);
			byte b[] = new byte[(int) file.length()];
			
			// page�� ContentType���� �������� �ٲٱ� ���� �ʱ�ȭ��Ŵ
			response.reset();
			response.setContentType("application/octet-stream");
			
			// �ѱ� ���ڵ�
			String encoding = new String(fileName.getBytes("euc-kr"),"8859_1");
			
			// ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
			response.setHeader("Content-Disposition", "attachment;filename="+ encoding);
			response.setHeader("Content-Length", String.valueOf(file.length()));
			
			if (file.isFile()) // ������ �������
			{
				FileInputStream fileInputStream = new FileInputStream(file);
				ServletOutputStream servletOutputStream = response.getOutputStream();
				
				//  ������ �о Ŭ���̾�Ʈ������ �����Ѵ�.
				int readNum = 0;
				while ( (readNum = fileInputStream.read(b)) != -1) {
					servletOutputStream.write(b, 0, readNum);
				}
				
				servletOutputStream.close();
				fileInputStream.close();
			}
			
		} catch (Exception e) {
			System.out.println("Download Exception : " + e.getMessage());
		}

		return null;
	}

}
