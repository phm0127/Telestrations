package com.ssafybus.telestrations.controller;

import java.awt.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/")
public class TestController {
	@RequestMapping(value = "/canvas", method = RequestMethod.GET)
	private String canvas(){		

		return "/paint/canvas";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	private String upload(@RequestParam(value="file", required=true) MultipartFile [] file,HttpServletRequest request) throws IOException{
		System.out.println(file[0]);
		
		
		//		File saveFile = new File(request.getContextPath()+"/picture/"+"fileName.png");
		//		if(!saveFile.exists()){
		//			saveFile.mkdirs();
		//		}
		//		file[0].transferTo(saveFile);

		writeFile(file[0], "test.png",request);
		System.out.println("watchCanvas");
		return "/paint/canvas";
	}
	
	private boolean writeFile(MultipartFile multipartFile, String saveFileName,HttpServletRequest request)
			throws IOException{
		boolean result = false;
		String path=request.getSession().getServletContext().getRealPath("/")+"resources/picture";
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
		fos.write(data);
		fos.close();

		return result;
	}
	
	

	@RequestMapping(value = "/watch", method = RequestMethod.GET)
	private String watch(Model model,HttpServletRequest request) throws IOException {
		String saveFileName="test.png";
		String path=request.getSession().getServletContext().getRealPath("/")+"resources/picture";
//		FileInputStream fis = new FileInputStream(path + "/" + saveFileName);
//		byte[] data = null;
//		fis.read(data);
		File sourceimage = new File(path + "/" + saveFileName);
		Image image = ImageIO.read(sourceimage);


		model.addAttribute("pictureSource",path + "/" + saveFileName);
		model.addAttribute("picture",image);
		return "/paint/watchCanvas";
	}
}
