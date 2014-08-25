class Sleeper
  POINTS = 20
  MAX_SLEEPS_PER_PERIOD = 1
  SLEEP_TIME = 10

  def initialize(adoption, user)
    @adoption = adoption
    @user = user
    sleep
  end

  def sleep
    reset_sleep_counter
    if wants_to_sleep?
      @adoption.update_attributes(
        score: @adoption.score + POINTS,
        sleep_counter: @adoption.sleep_counter.next,
        last_time_slept: Time.now
      )
    end
  end

  def wants_to_sleep?
    @adoption.sleep_counter < MAX_SLEEPS_PER_PERIOD
  end

  def reset_sleep_counter
    if @adoption.last_time_slept < SLEEP_TIME.hours.ago
      @adoption.update_attributes(
        sleep_counter: 0
      )
    end
  end
end
