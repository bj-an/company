package first.sample.dto;

public class ManageInfo {

	private int nooo;
	private String maincode;
	private String maincodename;
	private String isuse;
	private String writer;
	private String okdatedate;
	
	
	@Override
	public String toString() {
		return "ManageInfo [nooo=" + nooo + ", maincode=" + maincode + ", maincodename=" + maincodename + ", isuse="
				+ isuse + ", writer=" + writer + ", okdatedate=" + okdatedate + "]";
	}
	public int getNooo() {
		return nooo;
	}
	public void setNooo(int nooo) {
		this.nooo = nooo;
	}
	public String getMaincode() {
		return maincode;
	}
	public void setMaincode(String maincode) {
		this.maincode = maincode;
	}
	public String getMaincodename() {
		return maincodename;
	}
	public void setMaincodename(String maincodename) {
		this.maincodename = maincodename;
	}
	public String getIsuse() {
		return isuse;
	}
	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getOkdatedate() {
		return okdatedate;
	}
	public void setOkdatedate(String okdatedate) {
		this.okdatedate = okdatedate;
	}

	
	
	
	
	
	
	
	
	
	
}
