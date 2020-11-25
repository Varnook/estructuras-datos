LinkedLists_test: test_suite_utils.c ll_test_suite.c linkedLists.o
	cc $^ ../typeHelpers/typeFunctions.o -o $@

linkedLists.o: linkedLists.c
	cc $< -c

clean:
	rm LinkedLists_test linkedLists.o
