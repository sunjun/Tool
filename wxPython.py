#!/usr/bin/python
# -*- coding: utf-8 -*-
import wx

app = wx.App(False)  #创建一个新的应用程序对象，不能直接输出标准输出流/标准错误流到一个窗口。
frame = wx.Frame(None, wx.ID_ANY, "Hello World") #一个框架作为顶级窗口。
frame.Show(True)     #显示这个框架.
app.MainLoop()
