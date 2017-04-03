#Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.ShareInfo.disable()
Framer.Extras.Preloader.enable()
# Sketch
sketch = Framer.Importer.load("imported/2_JCv_B1-redesigned-6@1x")
{Artboard, enterpriseZone, normalZone, btnTop, cardNormal, plan1, moreDetails1, lessDetails1, info1, info1Mover, info1Gradient, info1Hider, tooltipPixel, hoverPixel, plan2, lessDetails2, moreDetails2, info2, info2Mover, info2Gradient, info2Hider,tooltipDynamic, hoverDynamic, plan3, lessDetails3, moreDetails3, info3, info3Mover, info3Gradient, info3Hider, tooltipReport, hoverReport, btnCard, bg, bgBot, bgTop, cardBG, cardEnterprise, lessDetailsEnterprise, moreDetailsEnterprise, enterpriseBottom, enterpriseMover, enterpriseGradient, enterpriseHider, enterpriseInfo, cardBGEnterprise, contactUs, freeTrialCopy} = sketch
# Arrays
hovers = [hoverPixel, hoverDynamic, hoverReport]
tooltips = [tooltipPixel, tooltipDynamic, tooltipReport]
affordances = [btnTop, enterpriseZone, normalZone, btnCard, moreDetails1, moreDetails2, moreDetails3, lessDetails1, lessDetails2, lessDetails3, moreDetailsEnterprise, lessDetailsEnterprise, contactUs]
moreDetails = [moreDetails1, moreDetails2, moreDetails3, moreDetailsEnterprise]
lessDetails = [lessDetails1, lessDetails2, lessDetails3, lessDetailsEnterprise]
Artboard.x = Align.center
#Scroll
# Make a scroll bar
# ------------------------------------------------------------
# createScroll = () ->
scroll = ScrollComponent.wrap(Artboard)
scroll.scrollVertical = true
scroll.scrollHorizontal = false
scroll.mouseWheelEnabled = true
# scroll.width = document.documentElement.clientWidth
# scroll.height = document.documentElement.clientHeight
scroll.content.draggable = false
scrollBar = new Layer
	x: Align.right
	width: 24
	height: Screen.height * (Screen.height / scroll.content.height)
	backgroundColor: ""

scrollBarShape = new Layer
	parent: scrollBar
	x: 8
	y: 8
	width: scrollBar.width - 16
	height: scrollBar.height - 16
	backgroundColor: "#8A8A8A"
	borderRadius: 100


scroll.onMove ->
	progress = scroll.scrollY / (scroll.content.height - scroll.height)
	scrollBar.y = progress * (Screen.height - scrollBar.height)

scrollBar.draggable.enabled = true
scrollBar.draggable.horizontal = false
scrollBar.draggable.constraints =
	height: Screen.height

scrollBar.onDrag ->
	progress = scrollBar.y / (Screen.height - scrollBar.height)
	scroll.scrollY = progress * (scroll.content.height - scroll.height)


Canvas.onResize ->
	scroll.size = Canvas.size
	scrollBar.x = Align.right
#Tooltips
createHovers = (index) ->
	hovers[index].onMouseOver ->
		tooltips[index].visible = true
	hovers[index].onMouseOut ->
		tooltips[index].visible = false

for i in [0...hovers.length]
	tooltips[i].visible = false
	createHovers(i)


hoverReport.onMouseOver ->
	tooltipReport.placeBefore(moreDetails1)
hoverReport.onMouseOut ->
	tooltipReport.placeBefore(hoverReport)
# Affordances
createAffordances = (index) ->
	affordances[index].onMouseOver ->
		document.body.style.cursor = "pointer"
	affordances[index].onMouseOut ->
		document.body.style.cursor = "auto"

for i in [0...affordances.length]
	createAffordances(i)
#Cards
cardBgShadow = new Layer
	backgroundColor: 'transparent'
	shadowX: 0
	shadowY: 2
	shadowBlur: 4
	shadowSpread: 1
	shadowColor: "rgba(0,0,0,0.13)"
	borderRadius: '5px'
	height: cardBG.height
	width: cardBG.width
	parent: cardNormal
	x: cardBG.x
	y: cardBG.y


cardBgEnterprise = new Layer
	backgroundColor: '#FFFFFF'
	shadowX: 0
	shadowY: 2
	shadowBlur: 4
	shadowSpread: 1
	shadowColor: "rgba(0,0,0,0.13)"
	borderRadius: '5px'
	height: cardBGEnterprise.height
	width: cardBGEnterprise.width
	parent: cardBGEnterprise

info1Hider.originY = 1
info2Hider.originY = 1
info3Hider.originY = 1

normalState = 0
enterpriseState = 0

moreDetails1.onClick ->
	normalState = normalState + 98
	cardBgShadow.animate
		height: cardBgShadow.height + 98
	plan2.animate
		y: plan2.y + 98
	plan3.animate
		y: plan3.y + 98
	bgBot.animate
		y: bgBot.y + 98
	info1Hider.animate
		scaleY: 0
	info1Gradient.animate
		y: info1Gradient.y + 91
		opacity: 0
	btnCard.animate
		y: btnCard.y + 98
	freeTrialCopy.animate
		y: freeTrialCopy.y + 98
	moreDetails1.visible = false
	lessDetails1.visible = true

lessDetails1.onClick ->
	if cardBgShadow.isAnimating is true
		return
	normalState = normalState - 98
	info1Gradient.opacity = 1
	cardBgShadow.animate
		height: cardBgShadow.height - 98
	plan2.animate
		y: plan2.y - 98
	plan3.animate
		y: plan3.y - 98
	bgBot.animate
		y: bgBot.y - 98
	info1Hider.animate
		scaleY: 1
	info1Gradient.animate
		y: info1Gradient.y - 91
	btnCard.animate
		y: btnCard.y - 98
	freeTrialCopy.animate
		y: freeTrialCopy.y - 98
	moreDetails1.visible = true
	lessDetails1.visible = false

moreDetails2.onClick ->
	normalState = normalState + 142
	cardBgShadow.animate
		height: cardBgShadow.height + 142
	plan3.animate
		y: plan3.y + 142
	bgBot.animate
		y: bgBot.y + 142
	info2Hider.animate
		scaleY: 0
	info2Gradient.animate
		y: info2Gradient.y + 135
		opacity: 0
	btnCard.animate
		y: btnCard.y + 142
	freeTrialCopy.animate
		y: freeTrialCopy.y + 142
	moreDetails2.visible = false
	lessDetails2.visible = true


lessDetails2.onClick ->
	if cardBgShadow.isAnimating is true
		return
	normalState = normalState - 142
	info2Gradient.opacity = 1
	cardBgShadow.animate
		height: cardBgShadow.height - 142
	plan3.animate
		y: plan3.y - 142
	bgBot.animate
		y: bgBot.y - 142
	info2Hider.animate
		scaleY: 1
	info2Gradient.animate
		y: info2Gradient.y - 135
	btnCard.animate
		y: btnCard.y - 142
	freeTrialCopy.animate
		y: freeTrialCopy.y - 142
	moreDetails2.visible = true
	lessDetails2.visible = false


moreDetails3.onClick ->
	normalState = normalState + 360
	cardBgShadow.animate
		height: cardBgShadow.height + 360
	bgBot.animate
		y: bgBot.y + 360
	info3Hider.animate
		scaleY: 0
	info3Gradient.animate
		y: info3Gradient.y + 367
		opacity: 0
	btnCard.animate
		y: btnCard.y + 360
	freeTrialCopy.animate
		y: freeTrialCopy.y + 360
	moreDetails3.visible = false
	lessDetails3.visible = true


lessDetails3.onClick ->
	if cardBgShadow.isAnimating is true
		return
	normalState = normalState - 360
	info3Gradient.opacity = 1
	cardBgShadow.animate
		height: cardBgShadow.height - 360
	bgBot.animate
		y: bgBot.y - 360
	info3Hider.animate
		scaleY: 1
	info3Gradient.animate
		y: info3Gradient.y - 367
	btnCard.animate
		y: btnCard.y - 360
	freeTrialCopy.animate
		y: freeTrialCopy.y - 360
	moreDetails3.visible = true
	lessDetails3.visible = false


cardEnterprise.visible = false

enterpriseZone.onClick ->
	cardEnterprise.visible = true
	cardNormal.visible = false
	bgBot.y = bgBot.y + 250 + enterpriseState - normalState
	freeTrialCopy.y = freeTrialCopy.y + 250 + enterpriseState - normalState
	cardBgEnterprise.height = cardBGEnterprise.height + enterpriseState

normalZone.onClick -> 
	cardNormal.visible = true
	cardEnterprise.visible = false
	bgBot.y = bgBot.y - 250 + normalState - enterpriseState
	freeTrialCopy.y = freeTrialCopy.y - 250 + normalState - enterpriseState
	cardBgShadow.height = cardBG.height + normalState

enterpriseHider.originY = 1

moreDetailsEnterprise.onClick ->
	enterpriseState = enterpriseState + 169
	cardBgEnterprise.animate
		height: cardBgEnterprise.height + 169
	bgBot.animate
		y: bgBot.y + 169
	enterpriseBottom.animate
		y: enterpriseBottom.y + 169
	freeTrialCopy.animate
		y: freeTrialCopy.y + 169
	enterpriseHider.animate
		scaleY: 0
	enterpriseGradient.animate
		y: enterpriseGradient.y + 149
		opacity: 0
	moreDetailsEnterprise.visible = false
	lessDetailsEnterprise.visible = true


lessDetailsEnterprise.onClick ->
	enterpriseState = enterpriseState - 169
	enterpriseGradient.opacity = 1
	cardBgEnterprise.animate
		height: cardBgEnterprise.height - 169
	bgBot.animate
		y: bgBot.y - 169
	enterpriseBottom.animate
		y: enterpriseBottom.y - 169
	freeTrialCopy.animate
		y: freeTrialCopy.y - 169
	enterpriseHider.animate
		scaleY: 1
	enterpriseGradient.animate
		y: enterpriseGradient.y - 149
	moreDetailsEnterprise.visible = true
	lessDetailsEnterprise.visible = false