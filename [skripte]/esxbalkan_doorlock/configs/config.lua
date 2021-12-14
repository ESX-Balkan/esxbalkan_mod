
--[[EEEEEEEEEEEEEEEEEEEEEE   SSSSSSSSSSSSSSS XXXXXXX       XXXXXXX     BBBBBBBBBBBBBBBBB           AAA               LLLLLLLLLLL             KKKKKKKKK    KKKKKKK               AAA               NNNNNNNN        NNNNNNNN
E::::::::::::::::::::E SS:::::::::::::::SX:::::X       X:::::X     B::::::::::::::::B             A:::A              L:::::::::L             K:::::::K    K:::::K              A:::A              N:::::::N       N::::::N
E::::::::::::::::::::ES:::::SSSSSS::::::SX:::::X       X:::::X     B::::::BBBBBB:::::B           A:::::A             L:::::::::L             K:::::::K    K:::::K             A:::::A             N::::::::N      N::::::N
EE::::::EEEEEEEEE::::ES:::::S     SSSSSSSX::::::X     X::::::X     BB:::::B     B:::::B         A:::::::A            LL:::::::LL             K:::::::K   K::::::K            A:::::::A            N:::::::::N     N::::::N
  E:::::E       EEEEEES:::::S            XXX:::::X   X:::::XXX       B::::B     B:::::B        A:::::::::A             L:::::L               KK::::::K  K:::::KKK           A:::::::::A           N::::::::::N    N::::::N
  E:::::E             S:::::S               X:::::X X:::::X          B::::B     B:::::B       A:::::A:::::A            L:::::L                 K:::::K K:::::K             A:::::A:::::A          N:::::::::::N   N::::::N
  E::::::EEEEEEEEEE    S::::SSSS             X:::::X:::::X           B::::BBBBBB:::::B       A:::::A A:::::A           L:::::L                 K::::::K:::::K             A:::::A A:::::A         N:::::::N::::N  N::::::N
  E:::::::::::::::E     SS::::::SSSSS         X:::::::::X            B:::::::::::::BB       A:::::A   A:::::A          L:::::L                 K:::::::::::K             A:::::A   A:::::A        N::::::N N::::N N::::::N
  E:::::::::::::::E       SSS::::::::SS       X:::::::::X            B::::BBBBBB:::::B     A:::::A     A:::::A         L:::::L                 K:::::::::::K            A:::::A     A:::::A       N::::::N  N::::N:::::::N
  E::::::EEEEEEEEEE          SSSSSS::::S     X:::::X:::::X           B::::B     B:::::B   A:::::AAAAAAAAA:::::A        L:::::L                 K::::::K:::::K          A:::::AAAAAAAAA:::::A      N::::::N   N:::::::::::N
  E:::::E                         S:::::S   X:::::X X:::::X          B::::B     B:::::B  A:::::::::::::::::::::A       L:::::L                 K:::::K K:::::K        A:::::::::::::::::::::A     N::::::N    N::::::::::N
  E:::::E       EEEEEE            S:::::SXXX:::::X   X:::::XXX       B::::B     B:::::B A:::::AAAAAAAAAAAAA:::::A      L:::::L         LLLLLLKK::::::K  K:::::KKK    A:::::AAAAAAAAAAAAA:::::A    N::::::N     N:::::::::N
EE::::::EEEEEEEE:::::ESSSSSSS     S:::::SX::::::X     X::::::X     BB:::::BBBBBB::::::BA:::::A             A:::::A   LL:::::::LLLLLLLLL:::::LK:::::::K   K::::::K   A:::::A             A:::::A   N::::::N      N::::::::N
E::::::::::::::::::::ES::::::SSSSSS:::::SX:::::X       X:::::X     B:::::::::::::::::BA:::::A               A:::::A  L::::::::::::::::::::::LK:::::::K    K:::::K  A:::::A               A:::::A  N::::::N       N:::::::N
E::::::::::::::::::::ES:::::::::::::::SS X:::::X       X:::::X     B::::::::::::::::BA:::::A                 A:::::A L::::::::::::::::::::::LK:::::::K    K:::::K A:::::A                 A:::::A N::::::N        N::::::N
EEEEEEEEEEEEEEEEEEEEEE SSSSSSSSSSSSSSS   XXXXXXX       XXXXXXX     BBBBBBBBBBBBBBBBBAAAAAAA                   AAAAAAALLLLLLLLLLLLLLLLLLLLLLLLKKKKKKKKK    KKKKKKKAAAAAAA                   AAAAAAANNNNNNNN         NNNNNNN
]]

-- VRATA GLAVNE BANKE

--PRVA VRATA
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = false,
	doors = {
		{
			objHash = -1215222675,
			objHeading = 270,
			objCoords = vector3(272.33694, 229.47932, 97.683593),
		},
		{
			objHash = 320433149,
			objHeading = 270,
			objCoords = vector3(272.33694, 229.47932, 97.683593),
		},
	},
	authorizedJobs = {
		['police'] = 0,
	}
})

--DRUGA VRATA
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = true,
	doors = {
		{
			objHash = -2023754432,
			objHeading = 180,
			objCoords = vector3(272.02688, 228.80418, 97.683525),
		},
		{
			objHash = -2023754432,
			objHeading = 0,
			objCoords = vector3(272.02688, 228.80418, 97.683525),
		},
	},
	authorizedJobs = {
		['police'] = 0,
	}
})

-- TRECA VRATA
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = true,
	doors = {
		{
			objHash = -2023754432,
			objHeading = 180,
			objCoords = vector3(304.10113, 230.87936, 97.688125),
		},
		{
			objHash = -2023754432,
			objHeading = 0,
			objCoords = vector3(304.10113, 230.87936, 97.688125),
		},
	},
	authorizedJobs = {
		['police'] = 0,
	}
})

--CETVRTA VRATA
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = true,
	doors = {
		{
			objHash = -2023754432,
			objHeading = 180,
			objCoords = vector3(288.4024, 223.48202, 97.688117),
		},
		{
			objHash = -2023754432,
			objHeading = 0,
			objCoords = vector3(288.4024, 223.48202, 97.688117),
		},
	},
	authorizedJobs = {
		['police'] = 0,
	}
})