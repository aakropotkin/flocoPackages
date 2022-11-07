{

  inputs.packument.url   = "https://registry.npmjs.org/@fastify/deepmerge?rev=2-34478ad3d6ec932da9e93b0331b4980e";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@fastify";
    ident = "@fastify/deepmerge";
    ldir  = "info/fastify/deepmerge";
    inherit packument fetchInfo;
  } // latest';

}
