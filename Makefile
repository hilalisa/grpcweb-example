regenerate:

	protoc -I. -Ivendor/ proto/library/book_service.proto \
    	--gopherjs_out=plugins=grpc,Mgoogle/protobuf/timestamp.proto=github.com/johanbrandhorst/protobuf/ptypes/timestamp:$$GOPATH/src \
    	--go_out=plugins=grpc:$$GOPATH/src
	go generate ./client/...

install:
	go install ./vendor/github.com/golang/protobuf/protoc-gen-go \
		./vendor/github.com/johanbrandhorst/protobuf/protoc-gen-gopherjs \
		./vendor/myitcv.io/react/cmd/reactGen \
		./vendor/myitcv.io/immutable/cmd/immutableGen

	# GopherJS cannot be vendored so must be fetched
	go get -u github.com/gopherjs/gopherjs
