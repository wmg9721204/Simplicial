## The following three functions, the latter relying on the former, are functions that plots (1) a simplex, (2) a simplicial complex, and (3) a filtration of simplicial complexes, respectively.
#######################################################################################
using PyPlot
include("types\\FiltrationOfSimplicialComplexes.jl")

## This function plots the simplex on the plane
## n=# of total vertices of the simplicial complex considered
## S=the vertices of the simplex; S must be a subset of Set(1:n)
## d=visual density of the inside of the simplex
function SimplexPlot(n::Int, S::Set{Int})
    Sorted=sort(collect(S))
    x=[cos(Sorted[i]*2*pi/n) for i=1:length(Sorted)]
    y=[sin(Sorted[i]*2*pi/n) for i=1:length(Sorted)]
    if length(Sorted)==1
        plot(x,y,color="black",".")
        elseif length(Sorted)==2
        plot(x,y,color="black",".")
        fill(x,y,facecolor="yellow",alpha=1)
        elseif length(Sorted)==2
        plot(x,y,color="black",".")
        fill(x,y,facecolor="red",alpha=1)
        elseif length(Sorted)==3
        plot(x,y,color="black",".")
        fill(x,y,facecolor="blue",alpha=1)
        elseif length(Sorted)==4
        plot(x,y,color="black",".")
        fill(x,y,facecolor="green",alpha=1) 
        elseif length(Sorted)==5
        plot(x,y,color="black",".")
        fill(x,y,facecolor="cyan",alpha=1)
    else
        plot(x,y,color="black",".")
        fill(x,y,facecolor="cyan",alpha=1)
    end
    for i=1:length(Sorted)
        annotate("$(Sorted[i])",(cos(Sorted[i]*2*pi/n),sin(Sorted[i]*2*pi/n)))
    end
end

######################################################################################################

## This function draws the graph of a simplicial complex
function SimplicialPlot(SC::SimplicialComplex)
    for S in SC.facets
        SimplexPlot(5,S)
    end
end

######################################################################################################

## This function draws the graphs of a filtration of simplicial complexes
function FilSimpPlot(FS::FiltrationOfSimplicialComplexes)
    figure(figsize=(4,4))
    for k=1:FS.birth[length(FS.birth)]
        SimplicialPlot(Sample(FS,k))
        figure(figsize=(4,4))
    end
end