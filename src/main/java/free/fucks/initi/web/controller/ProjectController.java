//package free.fucks.initi.web.controller;
//
//import free.fucks.initi.entity.project.Project;
//import free.fucks.initi.service.project.ProjectService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// *
// * @author Wellington Felipe Fucks
// *
// * @version 1.0
// * @since 1.0, 30/10/2015
// */
//@RestController
//@RequestMapping("project")
//public class ProjectController {
//
//    @Autowired
//    private ProjectService projectService;
//
//    /**
//     *
//     * @param id
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
//    public @ResponseBody
//    Project findProject(@PathVariable Long id) throws Exception {
//        return this.projectService.findById(id);
//    }
//
//    /**
//     *
//     * @param filter
//     * @param page
//     * @return
//     */
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public Page<Project> listProjectsByParams(@RequestParam("filter") String filter, Pageable page) {
//        return this.projectService.listByParams(filter, page);
//    }
//
//    /**
//     *
//     * @param project
//     * @return
//     */
//    @RequestMapping(value = "/create", method = RequestMethod.POST)
//    public @ResponseBody
//    Project createProject(@RequestBody Project project) {
//        return this.projectService.insert(project);
//    }
//
//    /**
//     *
//     * @param project
//     * @return
//     */
//    @RequestMapping(value = "/update", method = RequestMethod.POST)
//    public @ResponseBody
//    Project updateProject(@RequestBody Project project) {
//        return this.projectService.update(project);
//    }
//
//}
