package br.fucks.initial.entity;

import java.io.Serializable;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @param <ID>
 * @since 1.0, 29/10/2015
 */
public interface IEntity<ID extends Serializable> extends Serializable {

    /**
     *
     * @return
     */
    public ID getId();

    /**
     *
     * @param id
     */
    public void setId(ID id);
}
