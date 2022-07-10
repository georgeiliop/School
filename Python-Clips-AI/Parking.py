#Γιώργος Ηλιόπουλος 18390198
#Αργύρης Σιδέρης 45407

# **** The Parking Spaces Diagram
# **** Διάγραμμα των Χώρων του Πάρκινγκ
#   +-------+-------+
#   |   5   |   6   |
#   +-------+-------+
#   |   4   |   3   |
#   +-------+-------+
#   |   1   |   2   |
#   +-------+-------+
#       ^
#    entrance

spaces = {
    1: [2,4],
    2: [1,3],
    3: [2,4,6],
    4: [1,3,5],
    5: [4,6],
    6: [3,5]
}


# **** The Parking Initial State Diagram
# **** Διάγραμμα Αρχικής Κατάστασης του Πάρκινγκ
#
#   +--------+--------+
#   |  P5 NO |  P4 NO |
#   +--------+--------+
#   |  P3 NO |  P2 NO |
#   +--------+--------+
#   |   E    |  P1 NO |
#   +--------+--------+
#       ^
#   3 vehicles waiting


# **** The problem's initial state
# **** Αρχική Κατάσταση Προβλήματος
#
# 1ο στοιχείο : πλήθος αυτοκινήτων εκτος parking
# 2ο στοιχείο : χώρος 1 (που ειναι και ο χώρος εισόδου)
# 3ο στοιχείο : χώρος 2
# 4ο στοιχείο : χώρος 3
# 5ο στοιχείο : χώρος 4
# 6ο στοιχείο : χώρος 5
# 7ο στοιχείο : χώρος 6
  
#initial_state=[1, ['E', 'NO'], ['P1', 'NO'], ['P2', 'NO'], ['P3', 'NO'], ['P4', 'NO'], ['P5', 'NO'] ]  

import copy
import time
import math



# ******** Operators
# ******** Τελεστές

def make_queue(state):
    return [[state]]


def rounding(number, digits) -> float: # Rounding for the occurance rates
    stepper = 10.0 ** digits
    return math.trunc(stepper * number) / stepper


def extend_queue(queue, method):
    if method=='DFS':

        print("Queue:")
        print(queue)
        
        node=queue.pop(0)
        queue_copy=copy.deepcopy(queue)
        children=find_children(node[-1])
        
        for child in children:
            path=copy.deepcopy(node)
            path.append(child)
            queue_copy.insert(0,path)


    elif method=='BFS':
        if queue:
            print("Queue:")
            print(queue) # Εκτύπωση ουράς

            node=queue.pop(0) # Αφαιρούμε το πρώτο στοιχείο από την ουρά
            queue_copy=copy.deepcopy(queue) # Δημιουργούμε ένα αντίγραφο της ουράς
            children=find_children(node[-1]) 



            for child in children:

                path=copy.deepcopy(node)
                path.append(child)
                queue_copy.append(path)
        
    elif method=='BestFS':

        global CurrentCarsQ
        global QueueQueue
        if queue:

            node=queue.pop(0)

            queue_copy=copy.deepcopy(queue)
            children=find_children(node[-1])
            
            for child in children:
                path=copy.deepcopy(node)
                
                path.append(child)
                queue_copy.insert(0,path)
                
            
            

            for x in queue_copy:
                base = x[-1]

                for y in base:

                    if type(y) != int:
                        
                        if base[0] == CurrentCarsQ -1 :

                            if y[1] == 'YES':
                                
                                

                                QueueQueue.append(base)

                                print("Inserted Cars Memory: ",QueueQueue,"\n\n")
                                
                                
                                queue_copy = QueueQueue
                                
                                CurrentCarsQ = CurrentCarsQ - 1
                                
                                break

            
        #else: "other methods to be added" 
    return queue_copy


'''
 **** Τελεστής IN:
 **** Είσοδος αυτοκινήτου και τοποθέτηση σε άδεια πλατφόρμα στο χώρο εισόδου (1)
'''
def enter(state):
    if state[0]!=0 and state[1][0][0]=='P' and state[1][1]=='NO': # υπάρχει πλατφόρμα στο χώρο εισόδου χωρίς αυτοκίνητο (NO)
        new_state=[state[0]-1] + [[state[1][0], 'YES']] + state[2:] # είσοδος αυτοκινήτου στο parking  
        return new_state

'''
 **** Βοηθητικη συναρτηση swap: 
 **** Αντιμεταθέτει μέσα σε μια λιστα state τα δυο στoιχεία της που βρίσκονται στις θέσεις i & j
'''
def swap(state_l, i, j): 
    state_l[i], state_l[j] = state_l[j], state_l[i] 
    return state_l

'''
 **** Τελεστής neighbour1:
 **** Μετακίνηση 1ης πλατφόρμας που συνορεύει με κενό χώρο προς το γειτονικό της κενό χώρο 
 **** αντιμετάθεση e με πλατφόρμα, π.χ. [3, ['P1', 'NO'], ['P2', 'NO'], ['E', 'NO'], ['P3', 'NO']] ---> [3, ['P1', 'NO'], ['E', 'NO'], ['P2', 'NO'], ['P3', 'NO']]
'''
def neighbour1(state):    
    
    elem=['E','NO']
    i=state.index(elem) if elem in state else -1
    if i >=0:
        swap(state, i, spaces[i][0])
        return state

'''
 **** Τελεστής neighbour2:
 **** Μετακίνηση 2ης πλατφόρμας που συνορεύει με κενό χώρο προς τον γειτονικό της κενό χώρο
 **** αντιμετάθεση e με πλατφόρμα, π.χ. [3, ['P1', 'NO'], ['P2', 'NO'], ['E', 'NO'], ['P3', 'NO']] ---> [3, ['P1', 'NO'], ['P2', 'NO'], ['P3', 'NO'], ['E', 'NO']]
'''      
def neighbour2(state):
    
    elem=['E','NO']
    i=state.index(elem) if elem in state else -1
    if i >=0:
        swap(state, i, spaces[i][1])
        return state
    
'''
 **** Τελεστής neighbour3:
 **** Μετακίνηση 3ης πλατφόρμας που συνορεύει με κενό χώρο προς τον γειτονικό της κενό χώρο
'''      
def neighbour3(state):
    
    elem=['E','NO']
    i=state.index(elem) if elem in state else -1
    if len(spaces[i])==3:
        if i >=0:
            swap(state, i, spaces[i][2])
            return state

'''
Συνάρτηση εύρεσης απογόνων της τρέχουσας κατάστασης
'''
def find_children(state):
    
    children=[]
    
    enter_state=copy.deepcopy(state)
    enter_child=enter(enter_state)
    
    tr1_state=copy.deepcopy(state)
    tr1_child=neighbour1(tr1_state)
    
    tr2_state=copy.deepcopy(state)
    tr2_child=neighbour2(tr2_state)
     
    tr3_state=copy.deepcopy(state)
    tr3_child=neighbour3(tr3_state)
    

    
    if tr1_child is not None: 
        children.append(tr1_child)
        
    if tr2_child is not None:
        children.append(tr2_child)
        
    if tr3_child is not None:
        children.append(tr3_child)
        
    if enter_child is not None: 
        children.append(enter_child)     
        
    return children


""" ----------------------------------------------------------------------------
**** FRONT
**** Διαχείριση Μετώπου


----------------------------------------------------------------------------
** initialization of front
** Αρχικοποίηση Μετώπου
"""

def make_front(state):
    return [state]
    
""" ----------------------------------------------------------------------------
**** expanding front
**** επέκταση μετώπου    
"""

def expand_front(front, method):
    
    if method=='DFS':      
        if front:
            print("Front:")
            print(front) # Εκτύπωση μετώπου
            node=front.pop(0) # Αφαιρούμε το πρώτο στοιχείο από το μέτωπο

    # Βρίσκουμε τα παιδιά για το πρώτο στοιχείο του μετώπου
    # Τα προσθέτουμε στην αρχή του μετώπου
            for child in find_children(node):
                front.insert(0,child)
        
        
        
    
    elif method=='BFS':
        if front:
            print("Front:")
            print(front) # Εκτύπωση μετώπου
            node=front.pop(0) # Αφαιρούμε το πρώτο στοιχείο από το μέτωπο

    # Βρίσκουμε τα παιδιά για το πρώτο στοιχείο του μετώπου
    # Τα προσθέτουμε στο τέλος του μετώπου
            for child in find_children(node):
                front.append(child)

    elif method=='BestFS':
        
        if front:
            global CurrentCars
            Tfront = front

            
            node=front.pop(0)
            for child in find_children(node):     
                Tfront.insert(0,child)
                #Tfront.append(child)

            for x in Tfront:
                for y in x:
                    if type(y) != int:
                        if x[0] < CurrentCars:                            
                            if y[1] == 'NO':                               
                                front = make_front(x)
                                print("Optimal next Front is :", front)
                                CurrentCars = CurrentCars - 1
                                break
                            
    #initial_state = [3, ['E', 'NO'], ['P1', 'NO'], ['P2', 'NO'], ['P3', 'NO'], ['P4', 'NO'], ['P5', 'NO'] ]  
    #else: "other methods to be added"  
 
    return front

""" ----------------------------------------------------------------------------
**** Problem depending functions
**** ο κόσμος του προβλήματος (αν απαιτείται) και υπόλοιπες συναρτήσεις σχετικές με το πρόβλημα

  #### to be  added ####
"""
def is_goal_state(state):

    if state[0] == 0:
        return 0;
    
    #πρέπει να επιστρέψει 0 αν είναι goal state , δηλαδη αν το πρώτο στοιχίο είναι 0
""" ----------------------------------------------------------------------------
**** Basic recursive function to create search tree (recursive tree expansion)
**** Βασική αναδρομική συνάρτηση για δημιουργία δέντρου αναζήτησης (αναδρομική επέκταση δέντρου)
"""

#def find_solution(front, closed, goal, method):
def find_solution(front, queue, closed, method):
#def find_solution(front, closed, method):   

    if not front:
        print('_NO_SOLUTION_FOUND_')

    elif front[0] in closed:
        new_front=copy.deepcopy(front)
        new_front.pop(0)
        new_queue=copy.deepcopy(queue)
        new_queue.pop(0)
        #find_solution(new_front, closed, goal, method)
        find_solution(new_front, new_queue, closed, method)
        #find_solution(new_front, closed, method)
    
    elif is_goal_state(front[0])==0:
    #elif front[0]==goal:
        print('_GOAL_FOUND_')
        print(front[0])
    
    else:
        closed.append(front[0])
        front_copy=copy.deepcopy(front)
        front_children=expand_front(front_copy, method)
        queue_copy=copy.deepcopy(queue)
        queue_children=extend_queue(queue_copy, method)
        closed_copy=copy.deepcopy(closed)
        #find_solution(front_children, closed_copy, goal, method)
        find_solution(front_children, queue_children, closed_copy, method)
        #find_solution(front_children, closed_copy, method)
        
        
"""" ----------------------------------------------------------------------------
** Executing the code
** κλήση εκτέλεσης κώδικα
"""

def main():
    
    initial_state = [5, ['E', 'NO'], ['P1', 'NO'], ['P2', 'NO'], ['P3', 'NO'], ['P4', 'NO'], ['P5', 'NO'] ]  
    print("The initial State is",initial_state)
    global CurrentCars
    global CurrentCarsQ
    global QueueQueue 
    QueueQueue = initial_state
    QueueQueue = make_queue(QueueQueue)
    CurrentCars = CurrentCarsQ = initial_state[0]
    start = time.time()
    
    method='DFS'

    """ ----------------------------------------------------------------------------
    **** starting search
    **** έναρξη αναζήτησης
    """
   
    print('____BEGIN__SEARCHING____')
    
    find_solution(make_front(initial_state), make_queue(initial_state), [], method)
    
    end = time.time()
    print("Time elapsed in ms ", rounding((end - start),3))
    
#goal = [0, ['P1', 'YES'], ['P2', 'YES'], ['P3', 'YES'], ['E', 'NO']] , αν δεν υπήρχε η is_goal_state
#dfs_search_recursive_front(initial_state, [], [['',''],['',''],['',''],['p','']], 'DFS')
#find_solution(make_front(initial_state), [], goal, method)    
#find_solution(make_front(initial_state), [], method)
if __name__ == "__main__":
    main()
    

'''
Εξαντλητικοί έλεγχοι
'''
#state= [3, ['E', 'NO'], ['P1', 'NO'], ['P2', 'NO'], ['P3', 'NO']]  
#state= [3, ['P2', 'NO'], ['E', 'YES'], ['P2', 'NO'], ['P3', 'NO'],['P4', 'NO'],['P5', 'NO']]  
#new_state=enter(state)
#print(new_state)

#children=find_children(state)
#print(children)