CC = arm-eabi-gcc -Wa,--gdwarf2
EXEC = essai-map essai-red essai-map2


all: $(EXEC)

essai-map: essai-map.o map.o gestion_tab.o fg.o multiplication.o es.o
	$(CC) -o essai-map essai-map.o map.o gestion_tab.o fg.o multiplication.o es.o

essai-red: essai-red.o red.o gestion_tab.o fg.o multiplication.o es.o
	$(CC) -o essai-red essai-red.o red.o gestion_tab.o fg.o multiplication.o es.o

essai-map2: essai-map2.o map2.o gestion_tab.o fg.o multiplication.o es.o
	$(CC) -o essai-map2 essai-map2.o map2.o gestion_tab.o fg.o multiplication.o es.o

essai-map2.o: essai-map2.s
	$(CC) -c essai-map2.s

map2.o: map2.s
	$(CC) -c map2.s

essai-map.o: essai-map.s
	$(CC) -c essai-map.s

map.o: map.s
	$(CC) -c map.s

gestion_tab.o: gestion_tab.s
	$(CC) -c gestion_tab.s

fg.o: fg.s
	$(CC) -c fg.s

multiplication.o: multiplication.s
	$(CC) -c multiplication.s

essai-red.o: essai-red.s
	$(CC) -c essai-red.s

red.o: red.s
	$(CC) -c red.s

es.o: es.s
	$(CC) -c es.s
	
clean:
	rm -rf *.o $(EXEC)
