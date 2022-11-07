{

  inputs.packument.url   = "https://registry.npmjs.org/regexp.prototype.flags?rev=19-e837765f3a5a226940acfef532ffbc56";
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
    ident = "regexp.prototype.flags";
    ldir  = "info/unscoped/r/regexp.prototype.flags";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
