package com.example.demo.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.EdelNoticeVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Repository
public class EdelNoticeDAO 
{
	@Autowired
	private EdelNoticeXMLMapper noticeMapper;
	
	public int insert(EdelNoticeVO vo) {
		return noticeMapper.insertUser(vo);
	}
	
	public List<EdelNoticeVO> getNoticeList(){
		return noticeMapper.getNoticeList();
	}
	
	public EdelNoticeVO selectById(int num) {
		return noticeMapper.getUserById(num);
	}
	
	public int delete(int num) {
		return noticeMapper.deleteUser(num);
	}
	
	public int noticeUpdate(EdelNoticeVO vo) {
		return noticeMapper.updateNotice(vo);
	}
	
	public int viewCount(int num) {
		return noticeMapper.viewCount(num);
	}
	
	/** Open Source, MyBatis PageHelper 사용 예
	    * @param int pageNum : 추출하고자 하는 목록의 페이지 번호
	    * @param int pageSize : 한 페이지(화면)에 보여줄 목록의 아이템 수
	    * @return PageInfo : 목록의 한 페이지 아이템들과 페이징 관련 정보를 저장한 객체
	    */
	   public PageInfo<EdelNoticeVO> getNoticeListPage(int num, int pageSize){
	      PageHelper.startPage(num, pageSize);
	      PageInfo<EdelNoticeVO> pageInfo = new PageInfo<>(noticeMapper.getNoticeList());
	      return pageInfo;
	   }

	public List<EdelNoticeVO> getNoticeListPage(Pageable pageable) {
			return noticeMapper.getNoticeListPage(pageable);
	}
	   
	   
	 
}
