package pro.s2k.camp.vo;
import javax.xml.bind.annotation.XmlRootElement;

// JSP 페이지 이동시 항상 5개 값은 가지고 넘어가야 한다....
// 그 값을 받아주기 위한 VO
@XmlRootElement
public class CommonVO {

	private int p;
	private int s;
	private int b;
	private int currentPage;
	private int pageSize;
	private int blockSize;
	private int idx;
	private int rv_idx;
	private int co_idx;
	private int co_ref;
	private int co_seq;
	private int qna_idx;
	private int nt_idx;
	private String token;
	private String csrf;

	
	private String mode;
	
	public CommonVO() {
		paramCheck();
	}

	private void paramCheck() {
		if(p<1) {
			p = 1;
			currentPage = p;
		}
		if(s<1) {
			s = 10;
			pageSize = s;
		}
		if(b<1) {
			b = 10;
			blockSize = b;
		}
		if(idx<1) {
			idx = 0;
		}
		if(mode==null || mode.trim().length()==0) {
			mode="insert";
		}
	}

	public int getIdx() {
		return idx;
	}
	public int getRv_idx() {
		return rv_idx;
	}
	public int getCo_idx() {
		return co_idx;
	}
	public int getCo_ref() {
		return co_ref;
	}
	public int getCo_seq() {
		return co_seq;
	}
	public int getQna_idx() {
		return qna_idx;
	}
	public int getNt_idx() {
		return nt_idx;
	}
	public String getCsrf() {
		return csrf;
	}

	public void setIdx(int idx) {
		this.idx = idx;
		if(idx<1) {
			this.idx = 0;
		}
	}
	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
		if(rv_idx<1) {
			this.rv_idx = 0;
		}
	}
	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
		if(co_idx<1) {
			this.co_idx = 0;
		}
	}
	public void setCo_ref(int co_ref) {
		this.co_ref = co_ref;
		if(co_ref<1) {
			this.co_ref = 0;
		}
	}
	public void setCo_seq(int co_seq) {
		this.co_seq = co_seq;
		if(co_seq<1) {
			this.co_seq = 0;
		}
	}
	public String getToken() {
		return token;
		
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
		if(qna_idx<1) {
			this.qna_idx = 0;
		}
	}
	public void setNt_idx(int nt_idx) {
		this.nt_idx = nt_idx;
		if(nt_idx<1) {
			this.nt_idx = 0;
		}
	}


	public void setToken(String token) {
		this.token = token;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
		if(mode==null || mode.trim().length()==0) {
			this.mode="insert";
		}
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
		if(this.p<1) {
			this.p = 1;
		}
		currentPage = this.p;
	}

	public int getS() {
		return s;
	}

	public void setS(int s) {
		this.s = s;
		if(this.s<1) {
			this.s = 10;
		}
		pageSize = this.s;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
		if(this.b<1) {
			this.b = 10;
		}
		blockSize = this.b;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	@Override
	public String toString() {
		return "CommonVO [p=" + p + ", s=" + s + ", b=" + b + ", currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", blockSize=" + blockSize + ", idx=" + idx + ", rv_idx=" + rv_idx + ", co_idx=" + co_idx
				+ ", co_ref=" + co_ref + ", co_seq=" + co_seq + ", qna_idx=" + qna_idx + ", nt_idx=" + nt_idx
				+ ", token=" + token + ", mode=" + mode + "]";
	}

	


}
