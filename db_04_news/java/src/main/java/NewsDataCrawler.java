/*
 * CS3810 - Principles of Database Systems - Spring 2022
 * Instructor: Thyago Mota
 * Description: DB 04 - News Data Crawler
 * Student Name:
 */

import com.google.gson.*;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.mongodb.client.*;
import org.bson.Document;
import java.io.*;
import java.util.*;

// defines the source of a news article with id and name
class ArticleSource {

    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "source={" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    // returns a Document object representing the article source
    public Document toDocument() {
        Document doc = new Document();
        doc.append("id", id);
        doc.append("name", name);
        return doc;
    }
}

// defines a news article
class Article {

    private ArticleSource source;
    private String author;
    private String title;
    private String description;
    private String url;
    private String urlToImage;
    private String publishedAt;
    private String content;

    public ArticleSource getSource() {
        return source;
    }

    public void setSource(ArticleSource source) {
        this.source = source;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrlToImage() {
        return urlToImage;
    }

    public void setUrlToImage(String urlToImage) {
        this.urlToImage = urlToImage;
    }

    public String getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(String publishedAt) {
        this.publishedAt = publishedAt;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "article={" +
                "source=" + source +
                ", author='" + author + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", url='" + url + '\'' +
                ", urlToImage='" + urlToImage + '\'' +
                ", publishedAt='" + publishedAt + '\'' +
                ", content='" + content + '\'' +
                '}';
    }

    // returns a Document object representing the article
    public Document toDocument() {
        Document doc = new Document();
        doc.append("source", source.toDocument());
        doc.append("author", author);
        doc.append("title", title);
        doc.append("description", description);
        doc.append("urlToImage", urlToImage);
        doc.append("publishedAt", publishedAt);
        doc.append("content", content);
        return doc;
    }
}

// defines a news API response
class Response {

    private String        status;
    private int           totalResults;
    private List<Article> articles;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalResults() {
        return totalResults;
    }

    public void setTotalResults(int totalResults) {
        this.totalResults = totalResults;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    @Override
    public String toString() {
        return "Response={" +
                "status='" + status + '\'' +
                ", totalResults=" + totalResults +
                ", articles=" + articles +
                '}';
    }
}

// implements a news API data crawler, saving news articles in a MongoDB database
class NewsDataCrawler {

    private static final int PREEMPTIVE_BACKOFF_TIME = 2; // minutes
    private static final int PAGE_SIZE               = 10;

    private MongoClient   mongoClient;
    private MongoDatabase db;
    private String        newsAPIKey;
    private Gson          gson;

    public NewsDataCrawler() throws IOException {
        Properties prop = new Properties();
        prop.load(new FileInputStream("config.properties"));
        final String USER        = prop.getProperty("user");
        final String PASSWORD    = prop.getProperty("password");
        final String SERVER      = prop.getProperty("server");
        final String DATABASE    = prop.getProperty("database");
        final String CONNECT_URL = "mongodb+srv://" + USER + ":" + PASSWORD + "@" + SERVER;
        this.mongoClient = MongoClients.create(CONNECT_URL);
        this.db = mongoClient.getDatabase(DATABASE);
        this.newsAPIKey = prop.getProperty("news_api_key");
        this.gson = new GsonBuilder().create();
    }

    // TODO: call the news search API to retrieve news articles of the given topic, using parameters page and pageSize; insert all articles returned into a MongoDB collection named "articles"
    public void searchArticles(final String topic, int pageSize, int page) throws UnirestException {

    }

    public void done() {
        mongoClient.close();
    }

    // TODO: write an application that asks the user for a topic and retrieves 100 news articles from that topic, saving them in a MongoDB database; make sure to pause for 2m between API calls to avoid having your API key being locked out
    public static void main(String[] args) throws IOException, UnirestException {

    }
}
