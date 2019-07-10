review = ' this is a very worst filim'
pos_keyword = ('good','excellent','better','verygood','satisfied')
neg_keyword = ('bad','notgood','worst','dissapointed','awkard')
for key in pos_keyword:
   if key in review :
       print("REview is positive")
for key in neg_keyword:
   if key in review:
       print("Review is negative"  )
