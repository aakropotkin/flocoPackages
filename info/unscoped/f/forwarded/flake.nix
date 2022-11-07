{

  inputs.packument.url   = "https://registry.npmjs.org/forwarded?rev=16-c066d55813c5c7e77c76591ea4300330";
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
    ident = "forwarded";
    ldir  = "info/unscoped/f/forwarded";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
