root = exports ? this

class Project
  constructor: (@name, @owner, @begin, @end) ->

class Person
  constructor: (@name, @icon) ->

class TaskController

class ProjectController
  constructor: ->
    @el = $ '#project'
    @projects = [
      new Project('徐汇区法院', 'team1', new Date(2014, 2), new Date(2015, 2)),
      new Project('闵⾏行区法院', 'team1', new Date(2014, 3), new Date(2014, 8)),
      new Project('惠州中院', 'team1', new Date(2014, 3), new Date(2014, 4)),
      new Project('南海法院', 'team1', new Date(2014, 3, 20), new Date(2014, 6)),
      new Project('上海市政府', 'team1', new Date(2014, 2), new Date(2014, 5)),
      new Project('徐汇区人⼤', 'team1', new Date(2014, 3, 10), new Date(2014, 4)),
      new Project('崇明会议中⼼心视频会议', 'team1', new Date(2014, 3), new Date(2014, 5)),
      new Project('检验检疫局流媒体点播', 'team1', new Date(2014, 3, 15), new Date(2014, 4, 10)),
      new Project('虹口区法院', 'team1', new Date(2014, 3, 15), new Date(2014, 4, 30)),
      new Project('海事法院软件升级', 'team1', new Date(2014, 4, 10), new Date(2014, 4, 15)),
      new Project('最高院', 'team2', new Date(2014, 2, 1), new Date(2014, 3, 20)),
      new Project('黑龙江省高院', 'team2', new Date(2014, 5, 1), new Date(2014, 6, 1)),
      new Project('北京⾼院', 'team2', new Date(2014, 5, 1), new Date(2014, 6, 1)),
      new Project('北京⼈防', 'team2', new Date(2014, 2, 1), new Date(2014, 6, 1)),
      new Project('江西人防', 'team2', new Date(2014, 5, 1), new Date(2014, 7, 1)),
      new Project('武汉通⽤显控系统', 'team2', new Date(2014, 4, 1), new Date(2014, 5, 1)),
      new Project('新疆军区显控系统', 'team2', new Date(2014, 4, 15), new Date(2014, 4, 20)),
      new Project('GBVISION 3.0', 'team2', new Date(2014, 2, 1), new Date(2014, 5, 1)),
      new Project('GBVISION Windows版', 'team2', new Date(2014, 2, 1), new Date(2014, 5, 1)),
      new Project('济南农村信⽤用社会议预约', 'team2', new Date(2014, 3, 15), new Date(2014, 6, 1)),
      new Project('上海市检察院', 'team2', new Date(2014, 3, 10), new Date(2014, 6, 1)),
      new Project('中海油', 'team2', new Date(2014, 6, 1), new Date(2014, 8, 15)),
      new Project('智能建筑展', 'team2', new Date(2014, 3, 15), new Date(2014, 4, 20)),
      new Project('中国银⾏', 'team2', new Date(2014, 4, 20), new Date(2014, 6, 1)),
      new Project('烟台通用', 'team2', new Date(2014, 4, 1), new Date(2014, 4, 20)),
      new Project('天津电力', 'team3', new Date(2014, 2, 1), new Date(2014, 4, 20)),
      new Project('安徽电信', 'team3', new Date(2014, 2, 1), new Date(2014, 3, 1)),
      new Project('⼭东电力检修基地级联', 'team3', new Date(2014, 2, 1), new Date(2014, 4, 20)),
      new Project('山东电⼒改造', 'team3', new Date(2014, 4, 1), new Date(2014, 7, 1)),
      new Project('天津河北区检察院', 'team3', new Date(2014, 3, 15), new Date(2014, 4, 10)),
      new Project('GBTOUCH 3.0 产品资料', 'team3', new Date(2014, 4, 10), new Date(2014, 5, 1)),
      new Project('郑州期货交易所', 'team3', new Date(2014, 4, 10), new Date(2014, 6, 1)),
      new Project('河南烟草', 'team3', new Date(2014, 4, 10), new Date(2014, 6, 1)),
      new Project('MBO目标管理', 'team4', new Date(2014, 2, 15), new Date(2014, 4, 15)),
      new Project('项目管理体系-归档', 'team4', new Date(2014, 3, 20), new Date(2014, 5, 1)),
      new Project('项目开发流程-Git', 'team4', new Date(2014, 5, 1), new Date(2014, 7, 10)),
      new Project('研发项目立项', 'team4', new Date(2014, 4, 1), new Date(2014, 5, 1)),
      new Project('人员招聘', 'team4', new Date(2014, 4), new Date(2014, 10))
    ]

    @months = ['Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb']
    @months_index = Jan: 1, Feb: 2, Mar: 3, Apr:4, May: 5, Jun:6, Jul:7, Aug: 8, Sep: 9, Oct: 10, Nov: 11, Dec: 12

  # month 0,1,2 ... 11
  render: ->
    projects = @el.find 'ul#project-list'
    for each in @projects
      projects.append $('<li>').text(each.name)

    y = new Date().getFullYear()
    months_distance = []
    months_distance.push new Date y, month for month in [2..14]

    blocks = []
    for each, i in months_distance
      continue if i is 0
      blocks.push (each - months_distance[i-1])/1000/3600/24

    block_size = 12
    w = (block_size+2) * 52
    h = (block_size+2) * @projects.length + 1
    paper = root.Raphael 'calendar-graph', w, h

    months = @el.find 'ul#month-list'
    months.append $('<li>').text("#{@months[i]}").css(width: Math.ceil(w * each / 365)) for each, i in blocks

    for column in [0..52]
      paper.setStart()
      for i in [0...@projects.length]
        paper.rect(0, (block_size+2)*i, block_size, block_size).attr(fill: @colorize(i, column), 'stroke-width': 0)
      paper.setFinish().transform "...T#{column*(block_size+2)},2"

    # timeline
    current = (new Date() - new Date(y, 2)) / 1000.0 / 3600.0 / 24.0
    current = w * current / 365
    paper.path("M#{current},1V#{h-1}").attr(stroke: '#d9534f', 'stroke-width': 2)

  colorize: (row, col) ->
    # project - team - past or furture
    project = @projects[row]

    base = new Date new Date().getFullYear(), 2 # 3/1
    begin = new Date new Date(base).setDate base.getDate() + col*7
    end = new Date new Date(begin).setDate begin.getDate()+7

    intersect = @intersect { begin: project.begin, end: project.end }, {begin: begin, end: end}
    result = '#eee'
    if intersect
      past = new Date().getTime() > end.getTime()
      if project.owner is 'team1'
        result = if past then '#44a340' else '#d6e685'
      else if project.owner is 'team2'
        result = if past then '#a340a2' else '#d9aff1'
      else if project.owner is 'team3'
        result = if past then '#404ca3' else '#8590e6'
      else
        result = if past then '#f5d65a' else '#fae8a0'

    return result

  intersect: (span1, span2) ->
    span1.begin = span1.begin.getTime()
    span1.end = span1.end.getTime()
    span2.begin = span2.begin.getTime()
    span2.end = span2.end.getTime()

    return span1.begin < span2.end and span1.end > span2.begin

class PeopleController
  constructor: ->
    @el = $('#people .row')
    @people = []
    @people.push new Person '曹晖', '/images/icon/CaoHui.jpg'
    @people.push new Person '封昌俊', '/images/icon/Feng.jpg'
    @people.push new Person '葛晓东', '/images/icon/Ge.jpg'
    @people.push new Person '钟湘光', '/images/icon/Zhong.jpg'
    @people.push new Person '方宇昕', '/images/icon/Fang.jpg'
    @people.push new Person '曹炜俊', '/images/icon/CaoWeijun.jpg'
    @people.push new Person '孔祥海', '/images/icon/KongXianghai.jpg'
    @people.push new Person '宋康', '/images/icon/Song.jpg'
    @people.push new Person '陈欣聪', '/images/icon/Cong.jpg'
    @people.push new Person '张雷', '/images/icon/Lei.jpg'
    @people.push new Person '吴锦晟', '/images/icon/Tommy.jpg'
    @people.push new Person '龚雯', '/images/icon/Gong.jpg'
    @people.push new Person '任飞', '/images/icon/Ren.jpg'
    @people.push new Person '刘亦佳', '/images/icon/Liu.jpg'
    @people.push new Person '张佼', '/images/icon/Jiao.jpg'
    @people.push new Person '孔方媛', '/images/icon/Yuan.jpg'
    @people.push new Person '施齐华', '/images/icon/Shi.jpg'
    @people.push new Person '邓璟琨', '/images/icon/Deng.jpg'
    @people.push new Person '周红军', '/images/icon/Zhou.jpg'

  render: ->
    template = """
      <div class="col-xs-6 col-md-3">
        <div class="thumbnail">
          <img src="%img%">
          <h3>%name%</h3>
        </div>
      </div>
      """
    shuffle = _.shuffle(@people)
    for each in shuffle
      node = $ template.replace('%img%', each.icon).replace('%name%', each.name)
      @el.append node

class CalendarController
  constructor: ->
    @el = $('#calendar')
    @days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']

  render: ->
    calendar = $('<div>')
    w = 950
    h = window.screen.availHeight - 260
    calendar.css width: w, height: h
    now = new Date()

    now = new Date()
    begin = new Date now.getFullYear(), now.getMonth(), 1
    end = new Date now.getFullYear(), now.getMonth()+1, 1
    dayOfMonth = (end - begin) / 1000 / 3600 / 24
    dayOfWeek = begin.getDay()
    console.log 'day of month: ', dayOfMonth

    dayw = Math.ceil (w - 8) / 7 - 10
    dayh = Math.ceil (h - 6) / 6 - 5
    for row in [0...7]
      p = $('<div>').addClass('day-header').css float: 'left', margin: '1px 5px', width: dayw
      p.append $('<p>').text @days[row]
      calendar.append p

    for row in [0...dayOfWeek]
      p = $('<div>').addClass('day').css float: 'left', margin: '1px 5px', width: dayw, height: dayh
      calendar.append p

    for row in [1..dayOfMonth]
      p = $('<div>').addClass('day').css float: 'left', margin: '1px 5px', width: dayw, height: dayh
      p.append $('<p>').text row
      calendar.append p

    for row in [0...42-dayOfMonth-dayOfWeek+1]
      calendar.append $('<div>').addClass('day').css float: 'left', margin: '1px 5px', width: dayw, height: dayh
    @el.append calendar

root.PeopleController = PeopleController
root.TaskController = TaskController
root.ProjectController = ProjectController
root.CalendarController = CalendarController
