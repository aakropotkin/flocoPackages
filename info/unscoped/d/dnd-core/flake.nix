{

  inputs.packument.url   = "https://registry.npmjs.org/dnd-core?rev=125-885a6ab31229dce6e1a2b7f9da881f26";
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
    ident = "dnd-core";
    ldir  = "info/unscoped/d/dnd-core";
    inherit packument fetchInfo;
  } // latest';

}
