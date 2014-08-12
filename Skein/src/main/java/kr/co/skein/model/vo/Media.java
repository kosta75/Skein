package kr.co.skein.model.vo;

public class Media {

	private int mediaSeq;
	private int boardSeq;
	private String fileName;
	private int fileSize;
	private String extension;
	
	public int getMediaSeq() {
		return mediaSeq;
	}
	public void setMediaSeq(int mediaSeq) {
		this.mediaSeq = mediaSeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	
	
}
