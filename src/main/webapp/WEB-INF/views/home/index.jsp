<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="span9">

    <div class="article">
        <h4>Apache Mailet 2.5.0 发布</h4>
        <p>
            Apache Mailet 2.5.0 发布了，主要改进包括：

            * 合并 API、Base、Crypto、Standard 和 AI 在一起
            * 工件一致使用 apache-mailet 前缀
            * 所有的工件都是 OSGi 包
            * 升级到 Java 1.6
            * Bug 修复和其他改进

            Mailet API是一个用来创建邮件处理程序的简单的API,它被配置在邮件服务器端执行,分匹配器和Mailet的接口两种,匹配器根据特定的条件匹配邮件消息,并触发响应的Mailet.
        </p>

        <p>oschina 发布于： 2012年12月30日 (1评) </p>
    </div>

    <div class="article">
        <h4>BlackHole开发日记-多线程NIO和超时机制</h4>
        <p>
            今天尝试使用Selector改造转发逻辑，结果可耻的失败了！因为Selector不是线程安全的，试图多个线程进行register会导致严重的问题，这也是为什么基于事件的IO模型都不怎么支持多线程的原因，太难做了。

            后来尝试用Java的Future机制来实现超时。我们知道，Java的FutureTask需要一个执行的线程池。如果每次都new出来当然没有问题，但是经测试性能开销较大(qps被降到了4000)。后来尝试复用同一大线程池，发现请求多了之后，总是会超时！

            然后jstack查看发现，很多线程仍然卡在了Callable.call方法，就是我们常说的异常把线程抛死了！原来TimeoutException也会导致线程抛出异常但是无法回收。解决方法：使用future.cancel()。

            这也说明，线程抛出异常死掉时，jstack查看到的是它抛出异常时的执行栈。

            加入超时机制后，程序算是稳定了，这周末弄个1.0版吧，以后开始写ReleaseNotes。

            今天看了一下代码，作为一个开源项目，似乎风格不是那么优雅，很多长函数，注释也不完整。顶多对架构和原理感兴趣，代码的OOP神马的，这方面完全提不起兴趣来啊。

            在自己的MBP上也编译了一个queryperf，测试性能达到55000qps，而拦截模式只有35000，果然还是缓存byte[]更给力啊。因此把拦截模式也加入了cache。
        </p>

        <p>oschina 发布于： 2012年12月30日 (1评) </p>
    </div>


</div>