package com.amazon.service.spider.service;

import com.amazon.service.spider.SpiderConstant;
import com.amazon.service.spider.pojo.AmazonPageInfoPojo;
import org.springframework.util.StringUtils;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

/**
 * Created by User on 2017/6/14.
 */
public class AmazonPageProcessor implements PageProcessor {

    // 部分一：抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000);

    public void process(Page page) {
        AmazonPageInfoPojo amazonPageInfoPojo = new AmazonPageInfoPojo();
        amazonPageInfoPojo.setPageUrl(page.getRequest().getUrl());
        amazonPageInfoPojo.setProductTitle(page.getHtml().xpath("//span[@id='productTitle']/tidyText()").toString());
        amazonPageInfoPojo.setPriceblockSaleprice(page.getHtml().xpath("//span[@id='priceblock_dealprice']/text()").toString());
        amazonPageInfoPojo.setBrand(page.getHtml().xpath("//div[@id='merchant-info']/a[1]/text()").toString());
        amazonPageInfoPojo.setLandingImage(page.getHtml().xpath("//img[@id='landingImage']/@src").toString());
        amazonPageInfoPojo.setAsin(page.getHtml().xpath("//div[@id='averageCustomerReviews']/@data-asin").toString());

        if(StringUtils.isEmpty(amazonPageInfoPojo.getBrand())){
            amazonPageInfoPojo.setBrand(page.getHtml().xpath("//span[@id='merchant-info']/a[1]/text()").toString());
        }

        if(StringUtils.isEmpty(amazonPageInfoPojo.getPriceblockSaleprice())){
            amazonPageInfoPojo.setPriceblockSaleprice(page.getHtml().xpath("//span[@id='priceblock_saleprice']/text()").toString());
        }

        if(StringUtils.isEmpty(amazonPageInfoPojo.getPriceblockSaleprice())){
            amazonPageInfoPojo.setPriceblockSaleprice(page.getHtml().xpath("//span[@id='priceblock_ourprice']/text()").toString());
        }

        if(StringUtils.isEmpty(amazonPageInfoPojo.getPriceblockSaleprice())){
            amazonPageInfoPojo.setPriceblockSaleprice(page.getHtml().xpath("//span[@class='a-size-medium a-color-price']/text()").toString());
        }

        page.putField(SpiderConstant.AMAZON_PAGE_INFO_POJO,amazonPageInfoPojo);
    }

    public Site getSite() {
        return site;
    }
}
