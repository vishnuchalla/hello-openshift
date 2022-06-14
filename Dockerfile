FROM registry.access.redhat.com/ubi8/ubi-minimal as builder
RUN microdnf install golang git
RUN git clone https://github.com/cloud-bulldozer/hello-openshift
RUN cd hello-openshift && go build -o hello-openshift hello_openshift.go

FROM registry.access.redhat.com/ubi8/ubi-minimal
COPY --from=builder /hello-openshift/hello-openshift /hello-openshift
EXPOSE 8080 8888
USER 1001
ENTRYPOINT ["/hello-openshift"]
