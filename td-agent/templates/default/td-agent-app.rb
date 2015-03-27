<source>
 type forward
</source>

<source>
  type config_expander
  <config>
    type tail
    path        /var/log/httpd/development_test-access.log
    format      ltsv
    time_key    time
    time_format %d/%b/%Y:%H:%M:%S %z
    pos_file    /var/log/td-agent/apache.access_log.pos
    tag         td.apache.access
  </config>
</source>

<source>
  type config_expander
  <config>
    type tail
    format      /^\[[^ ]* (?<time>[^\]]*)\] \[(?<level>[^\]]*)\] \[pid (?<pid>[^\]]*)\] \[client (?<client>[^\]]*)\] (?<message>.*)$/
    path        /var/log/httpd/error_log
    pos_file    /var/log/td-agent/apache.error_log.pos
    tag         td.apache.error
  </config>
</source>

<source>
  type config_expander
  <config>
    type         tail
    format       syslog
    path         /var/log/messages
    pos_file     /var/log/td-agent/syslog.messages.pos
    tag          td.syslog.messages
  </config>
</source>

# Output
<match td.**>
  type forward
  send_timeout 60s
  recover_wait 10s
  heartbeat_interval 1s
  phi_threshold 8
  hard_timeout 60s

  <server>
    name server1
    host 52.11.225.224
    port 24224
  </server>
</match>
