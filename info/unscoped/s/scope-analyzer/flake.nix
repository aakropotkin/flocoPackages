{

  inputs.packument.url   = "https://registry.npmjs.org/scope-analyzer?rev=17-87703fe8ba4d4b0b99c8cdb7492641e5";
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
    ident = "scope-analyzer";
    ldir  = "info/unscoped/s/scope-analyzer";
    inherit packument fetchInfo;
  } // latest';

}
