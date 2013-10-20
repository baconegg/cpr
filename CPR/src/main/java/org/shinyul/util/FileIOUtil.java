package org.shinyul.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileIOUtil {
	
	/*public FileUploadUtil fileUploadUtil;*/
	
	//	255 255
	// 썸네일 저장용 변수와아이들...
	private final static int width = 400;
//	private final static int mWidth = 400;
	private final static int height = 300;
//	private final static int mHeight = 300;
	private final static String type = "jpg";

	public static void control(String cmd, MultipartFile ori_file,String fileName) {
		// 저장용 경로..
		String path = null;
		String thpath = null;
		// 0:상품 1:사람(상인)
		switch (cmd) {
		case Constant.File.SELLER:
			path = "D:\\images\\product\\original\\";
			thpath = "D:\\images\\product\\thumb\\";
			break;
		case Constant.File.PRODUCT:
			path = "D:\\images\\seller\\original\\";
			thpath = "D:\\images\\seller\\thumb\\";
			break;
		}
		saveFile(ori_file, path, thpath, fileName);
	}

	private static void saveFile(MultipartFile ori_file, String path, String thpath,String fileName) {

		/*// 랜덤uuid.jpg를 생성하고 이씀미다!!!
		StringBuilder uuidName = new StringBuilder();
		uuidName.append(UUID.randomUUID().toString());
		uuidName.append(".jpg");
		String fileName = uuidName.toString();
		System.out.println("테스트중!!!");*/

		// 원본 파일 데이터 저장
		if (!ori_file.isEmpty()) {
			try {
				// 이름 바꿔주는 작업 할것..
				File file = new File(path + "\\" + fileName);
				System.out.println("테스트중!!!2");
				// list//////////////////////
				File newfile = new File(thpath + "\\" + fileName);
				/*File refile = new File(fileName);*/
				ori_file.transferTo(file);
				// refile 을 ImageIO로 읽어서 BufferedImage에 슛
				BufferedImage img = ImageIO.read(file);
				// 이건 400x300의 새로운 버퍼드 이미지 newimg 임미다...
				BufferedImage newimg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				// 2D그래픽으로 newimg에 그립니다???
				Graphics2D g2 = newimg.createGraphics();
				g2.drawImage(img, 0, 0, width, height, null);
				// (원본/타입/쓸꺼)
				ImageIO.write(newimg, type, newfile);				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//return uuidName.toString();
	}
	
	public static String gUuid(){
		StringBuilder uuidName = new StringBuilder();
		uuidName.append(UUID.randomUUID().toString());
		uuidName.append(".jpg");		
		return uuidName.toString();
	}
	
}
