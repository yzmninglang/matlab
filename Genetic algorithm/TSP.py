import pandas as pd
import random
import numpy as np
import operator
class City:
    def __init__(self,x,y):
        self.x = x
        self.y = y

    def distance(self,city):
        xDis = abs(self.x-city.x)
        yDis = abs(self.y-city.y)
        distance = np.sqrt((xDis**2)+(yDis**2))
        return distance

    def  __repr__(self):
        return (self.x,self.y)


class Fitness:
    def __init__(self,route):
        self.route = route
        self.distance = 0
        self.Fitness =0
    def routedistance(self):
        if self.distance ==0:
            pathdistance = 0
            for i in range(0,len(self.route)):
                fromCity =self.route[i]
                toCity = None
                if i+1< len(self.route):
                    toCity = self.route[i+1]
                else:
                    toCity = self.route[0]
                pathdistance += fromCity.distance(toCity)
            self.distance = pathdistance
        return self.distance
    def routeFitness(self):
        if self.Fitness == 0:
            self.Fitness = 1/float(self.routedistance())

        return self.Fitness


# create individual of population
def  createRoute(citylist):
    # randomly shuffle the list of citylist
    route =random.sample(citylist,len(citylist))
    return route

# create population Init_population
def initPopulation(popsize ,citylist):
    population =[]
    
    for i in range(popsize):
        population.append(createRoute(citylist))

    return population

def rankRoutes(population):
    Fitnessresults ={}

    for i in range(len(population)):
        Fitnessresults[i]=Fitness(population[i]).routeFitness()
    #resort the fitness of every route in routelist depended on item(1)
    return sorted(Fitnessresults.items,key=operator.itemgetter(1),reverse=True)

def selection(popRanked ,eliteSize):
    selectionResults = []
    df = pd.DataFrame(np.array(popRanked),columns=["index","Fitness"])
    df['cum_sum'] = df.Fitness.cum_sum()
    df['cum_perc'] = 100*df.cum_sum/df.Fitness.sum()

    for i in range(0,eliteSize):
        selectionResults.append(popRanked[i][0])
    for i in range(0,len(popRanked)-eliteSize):
        pick = 100*random.random()
        for i in range(len(popRanked)):
            if pick <= df.iat[i,3]:
                selectionResults.append(popRanked[i][0])
                break
    return selectionResults 

def matingPool(population,selectionResults):
    matingpool = []
    for i in range(len(selectionResults)):
        index =selectionResults[i]
        matingpool.append(population[index])
    return matingpool

def nextGeneration(currentGen, eliteSize, mutationRate):
    popRanked = rankRoutes(currentGen)
    selectionResults = selection(popRanked, eliteSize)
    matingpool = matingPool(currentGen, selectionResults)
    children = breedPopulation(matingpool, eliteSize)
    nextGeneration = mutatePopulation(children, mutationRate)
    return nextGeneration

def geneticAlgorithm(population, popSize, eliteSize, mutationRate, generations):
    pop = initPopulation(popSize, population)
    print("Initial distance: " + str(1 / rankRoutes(pop)[0][1]))
    
    for i in range(0, generations):
        pop = nextGeneration(pop, eliteSize, mutationRate)
    
    print("Final distance: " + str(1 / rankRoutes(pop)[0][1]))
    bestRouteIndex = rankRoutes(pop)[0][0]
    bestRoute = pop[bestRouteIndex]
    return bestRoute
cityList = []

for i in range(0,25):
    cityList.append(City(x=int(random.random() * 200), y=int(random.random() * 200)))

geneticAlgorithm(population=cityList, popSize=100, eliteSize=20, mutationRate=0.01, generations=500)

def geneticAlgorithmPlot(population, popSize, eliteSize, mutationRate, generations):
    pop = initialPopulation(popSize, population)
    progress = []
    progress.append(1 / rankRoutes(pop)[0][1])
    
    for i in range(0, generations):
        pop = nextGeneration(pop, eliteSize, mutationRate)
        progress.append(1 / rankRoutes(pop)[0][1])
    
    plt.plot(progress)
    plt.ylabel('Distance')
    plt.xlabel('Generation')
    plt.show()
geneticAlgorithmPlot(population=cityList, popSize=100, eliteSize=20, mutationRate=0.01, generations=500)