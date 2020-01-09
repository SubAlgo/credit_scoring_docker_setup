# option หมายถึง ไม่จำเป็นต้องทำก็ได้



# Deploy postgres
    # 1 create container
        # docker run -it -d --name={set_container_name} -e POSTGRES_USER={create_database_user} -e POSTGRES_PASSWORD={set_user_password} -e POSTGRES_DB={create =_database} --restart=always postgres:11.4 
        docker run -it -d --name=subalgo_credit_scoring_postgres -e POSTGRES_USER=creditScoringAdmin -e POSTGRES_PASSWORD=B4sG37z6Pa2xTb6t -e POSTGRES_DB=credit_scoring_v2 --restart=always postgres:11.4
    # 2 create table and import data
        # cat {sql_scripot_file} | docker exec -i {postgres_container} psql -U {database_user} -d {database_name} 
        cat credit_scoring_v2.sql | docker exec -i subalgo_credit_scoring_postgres psql -U creditScoringAdmin -d credit_scoring_v2

    # Option check data in container
        #   [open prompt] docker exec -it {postgres_container_name} sh
            docker exec -it subalgo_credit_scoring_postgres sh
        #   [connect to database] psql -U {postgres_username} -d {postgres_database}
            psql -U creditScoringAdmin -d credit_scoring_v2 
        #   [list database table] \dt
            \dt
    
    
# Deplot redis [https://github.com/docker-library/redis/issues/46]

    # create redis server
        #   docker run --name={set_container_name} -d --restart=always redis:5.0.5 redis-server --requirepass {set_redis_password}
            docker run --name=subalgo_credit_scoring_redis -d --restart=always redis:5.0.5 redis-server --requirepass 5HtfJt5vB7sNfbLd

    # [option]create redis client for test connect to redis server
        #   docker run --name {set_container_name} -it --link {container_redis_server_name}:{set_alias} --rm {redis_image} redis-cli -h {alias} -p {set_container_port}
            docker run --name credit_scoring_redis_client -it --link subalgo_credit_scoring_redis:redis --rm redis:5.0.5 redis-cli -h redis -p 6379
        #   [test authen] AUTH {redis_password}
            AUTH 5HtfJt5vB7sNfbLd
            # result should be : OK

# Deploy backend

    # docker run -d --name={set_container_name} \
    #       --restart=always
	#       --link {postgres_container_name}:db \
	#       --link {redis_container_name}:redis \
	#       --env DB_URL=postgres://{postgres_usersname}:{postgres_password}@db/{database_name}?sslmode=disable \
	#       --env REDIS_ADDR=redis:6379 \
    #       --env REDIS_PASSWORD={redis_password} \
	#       {backend_image}

    docker run -d --name=subalgo_credit_scoring_api \
            --restart=always \
	        --link subalgo_credit_scoring_postgres:db \
	        --link subalgo_credit_scoring_redis:redis \
	        --env DB_URL=postgres://creditScoringAdmin:B4sG37z6Pa2xTb6t@db/credit_scoring_v2?sslmode=disable \
	        --env REDIS_ADDR=redis:6379 \
            --env REDIS_PASSWORD=5HtfJt5vB7sNfbLd \
	        subalgo/credit_scoring:1.0
    
# deploy frontend
    #   docker run -d --name={set_container_name} \
    #       --restart=always
	#       --link {backend_container_name}:api \
	#       --env PORT={post number} \
    #       -p 8080:8080 \
	#       --env API_ENDPOINT=http://api:8000 \
	#       {front_image}

    docker run -d --name=subalgo_credit_scoring_frontend \
        --restart=always \
	    --link subalgo_credit_scoring_api:api \
	    --env PORT=8080 \
	    --env API_ENDPOINT=http://api:8000 \
        -p 8080:8080 \
	    subalgo/credit_scoring-vue 
