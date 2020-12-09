#ifndef DATAQUERY_H
#define DATAQUERY_H

#include <QObject>
#include<QtDebug>
#include<QtSql>
#include<QSqlDatabase>
#include<QSqlQuery>
#include<QSqlQuery>
#include<QVariant>
#include<QSqlError>

//关于三种登录身份的标识,type==ADMIN
#define ADMIN 1
#define TEACHER 2
#define STUDENT 3

class DataQuery :QObject
{
    Q_OBJECT
public:
    static DataQuery* getDataQuery();
    /**
     * @brief connectToDatabase
     * 连接数据库
     * @param userName
     * 登录名
     * @param password
     * 密码
     * @return
     * 连接结果
     */
    QString connectToDatabase(QString userName,QString password);
    /**
     * @brief canLogInSIMS
     * 判断用户名和密码是否正确，是否允许登录程序
     * @param userName
     * 用户账号
     * @param password
     * 密码
     * @param type
     * 登陆类型，有三种：ADMIN,TEACHER,STUDENT
     * @return
     * 是否允许登录
     */
    bool canLogInSIMS(QString userName,QString password,int type);
private:
    /**
     * @brief db
     * 数据库实例
     */
    QSqlDatabase db;
    DataQuery();
    ~DataQuery();
};

#endif // DATAQUERY_H
