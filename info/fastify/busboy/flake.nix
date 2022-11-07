{

  inputs.packument.url   = "https://registry.npmjs.org/@fastify/busboy?rev=10-fba359d3fc530aa2c1891a65ef3e4438";
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
    ident = "@fastify/busboy";
    ldir  = "info/fastify/busboy";
    inherit packument fetchInfo;
  } // latest';

}
