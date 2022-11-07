{

  inputs.packument.url   = "https://registry.npmjs.org/yaml?rev=118-2fadbd9de73bd6f6cd50a4dd5aebf776";
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
    scope = null;
    ident = "yaml";
    ldir  = "info/unscoped/y/yaml";
    inherit packument fetchInfo;
  } // latest';

}
