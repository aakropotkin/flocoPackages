{

  inputs.packument.url   = "https://registry.npmjs.org/ejs?rev=498-e119b3920bbb7abefe5cf487d5e74607";
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
    ident = "ejs";
    ldir  = "info/unscoped/e/ejs";
    inherit packument fetchInfo;
  } // latest';

}
