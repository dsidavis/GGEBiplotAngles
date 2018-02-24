getAngles =
    #
    # getAngles(m1, c(FALSE, TRUE))
    # getAngles(m1$locCoord[,1:2], c(FALSE, TRUE))
    #
function(x, flip = c(FALSE, FALSE), comps = c(1, 2), ...)
    UseMethod("getAngles")

getAngles.gge =
function(x, flip = c(FALSE, FALSE), comps = c(1, 2), ...)    
   getAngles(x$locCoord[, comps], flip)

getAngles.matrix =
function(x, flip = c(FALSE, FALSE), comps = c(1, 2), ...)    
{
    x[, flip] = x[, flip, drop = FALSE] * -1
    idx = seq(length = nrow(x))
    i = expand.grid(idx, idx)
    ans = apply(i, 1, function(idx) computeAngle(x[idx[1],], x[idx[2],]))
    ids = rownames(x)
    matrix(ans, length(ids), length(ids), dimnames = list(ids, ids))
}

computeAngle =
    #
    # computeAngle(c(1, 0), c(0, 1)) = pi/2
    # computeAngle(c(0, 1), c(0, -1)) = pi
    # computeAngle(c(1, 1), c(1, -1))*2 = pi
    #
    #
function(x, y)
{
    dot = sum(x*y)/sqrt(sum(x^2) * sum(y^2))
    acos(dot)
}
