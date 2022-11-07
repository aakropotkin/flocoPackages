{

  inputs.packument.url   = "https://registry.npmjs.org/hiredis?rev=104-c743ffc445fe98e266c3713fdcdc1cfb";
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
    ident = "hiredis";
    ldir  = "info/unscoped/h/hiredis";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
