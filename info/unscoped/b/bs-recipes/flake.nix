{

  inputs.packument.url   = "https://registry.npmjs.org/bs-recipes?rev=18-73b9528d83ed57ec4966bef3ed7323fa";
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
    ident = "bs-recipes";
    ldir  = "info/unscoped/b/bs-recipes";
    inherit packument fetchInfo;
  } // latest';

}
