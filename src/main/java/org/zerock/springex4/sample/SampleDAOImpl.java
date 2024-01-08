package org.zerock.springex4.sample;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("normal")
public class SampleDAOImpl implements SampleDAO{
}
