package kr.or.ddit.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.IDPictureVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;

public class AttachFileMapper {

	public static List<FileItemVO> mapping(String bo_no, FileItem[] items) {
		List<FileItemVO> fileItemList = new ArrayList<FileItemVO>();
		if(items!=null){
			FileItemVO fileItemInfo = new FileItemVO();
			for(FileItem item : items){
				fileItemInfo = new FileItemVO();
				fileItemInfo.setFile_bo_no(bo_no);
				//D:\\a.png => a.png
				String fileName = FilenameUtils.getName(item.getName());
				fileItemInfo.setFile_name(fileName);
				
				//a.png => a   png
				// a
				String baseName = FilenameUtils.getBaseName(fileName);   
				//png
				String extensionName = FilenameUtils.getExtension(fileName);   
				
				// UUID ( Universally Unique Identifier) - 128bit의 랜덤한 값 반환
				String genID = UUID.randomUUID().toString().replace("-", "");
				//a1239048710923487.png
				String saveFileName = baseName+genID+"."+extensionName;
				fileItemInfo.setFile_save_name(saveFileName);
				fileItemInfo.setFile_content_type(item.getContentType());
				fileItemInfo.setFile_size(String.valueOf(item.getSize()));
				
				fileItemList.add(fileItemInfo);
				saveFile(saveFileName,item);
				
			}
		}
		return fileItemList;
	}
	
	private static void saveFile(String fileName , FileItem item){
		File targetFile = new File(GlobalConstant.SAVE_PATH, fileName);
		try {
			item.write(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static IDPictureVO idPicMapping(String mem_id,FileItem item) {
		IDPictureVO idPictureInfo = null;
		if(item!=null){
			idPictureInfo=new IDPictureVO();
			idPictureInfo.setFile_mem_id(mem_id);
			String fileName = FilenameUtils.getName(item.getName());
			idPictureInfo.setFile_name(fileName);
			String baseName = FilenameUtils.getBaseName(fileName);   
			String extensionName = FilenameUtils.getExtension(fileName);   
			String genID = UUID.randomUUID().toString().replace("-", "");
			String saveFileName = baseName+genID+"."+extensionName;
			idPictureInfo.setFile_save_name(saveFileName);
			idPictureInfo.setFile_content_type(item.getContentType());
			idPictureInfo.setFile_size(String.valueOf(item.getSize()));
			
			saveFile(saveFileName,item);
				
		}
		
		return idPictureInfo;
	}
	
}
