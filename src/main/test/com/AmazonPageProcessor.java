package com;

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
        page.putField("productTitle", page.getHtml().xpath("//span[@id='productTitle']/tidyText()"));
        page.putField("priceblock_saleprice", page.getHtml().xpath("//span[@id='priceblock_saleprice']/tidyText()"));
        page.putField("brand", page.getHtml().xpath("//a[@id='brand']/text()"));

    }

    public Site getSite() {
        return site;
    }
}
